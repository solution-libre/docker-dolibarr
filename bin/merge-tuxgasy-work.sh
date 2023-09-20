#!/usr/bin/env sh
#
# Copyright (C) 2022-2023 Solution Libre <contact@solution-libre.fr>
# 
# This file is part of Docker Dolibarr.
# 
# Docker Dolibarr is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Docker Dolibarr is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Docker Dolibarr.  If not, see <http://www.gnu.org/licenses/>.

CWD=$(pwd)
DIR='tuxgasy-dolibarr'

cmd_check() {
  cmd=$1
  if ! command -v "$cmd" > /dev/null
  then
    echo "$cmd is require and could not be found. Please install it."
    exit 1
  fi
}

cmd_check 'git'

if ! git filter-repo --version > /dev/null 2>&1
then
    echo "git-filter-repo is require and could not be found. Please install it."
    exit 2
fi

cd /tmp || exit

git clone https://github.com/tuxgasy/docker-dolibarr.git "${DIR}"
cd "${DIR}" || exit

git remote rm origin

git filter-repo --force\
  --path-rename LICENSE:tuxgasy/LICENSE\
  --path-rename examples/with-pgsql/docker-compose.yml:tuxgasy/compose.yaml\
  --path-rename examples/with-secrets/env/dolibarr.env:tuxgasy/env/dolibarr.env\
  --path-rename examples/with-secrets/secrets/dolibarr_admin_password.secret:tuxgasy/secrets/dolibarr_admin_password.secret\
  --path-rename examples/with-secrets/secrets/dolibarr_admin_username.secret:tuxgasy/secrets/dolibarr_admin_username.secret

git filter-repo --force\
  --path tuxgasy

git reset --hard
git gc --aggressive 
git prune
git clean -fd

echo 'DOLI_DB_TYPE=pgsql' >> tuxgasy/env/dolibarr.env
sed -i\
  -e 's/\(DOLI_DB_HOST=\).*/\1postgres/'\
  -e 's/\(DOLI_DB_HOST_PORT=\).*/\15432/'\
  tuxgasy/env/dolibarr.env

sed -i\
  -e '2,7 s/./# &/'\
  -e '19,29 s/./# &/'\
  -e '33,35 s/./# &/'\
  -e '39,41 s/./# &/'\
  -e '44,45 s/./# &/'\
  tuxgasy/compose.yaml

git add tuxgasy
git commit -m 'Adjustments of Tuxgasy files'

cd "${CWD}" || exit

git remote add tuxgasy "/tmp/${DIR}"
git fetch tuxgasy
git rebase tuxgasy/master

git remote remove tuxgasy
rm -rf "/tmp/${DIR}"
