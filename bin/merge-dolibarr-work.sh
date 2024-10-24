#!/usr/bin/env sh
#
# Copyright (C) 2022-2023 Solution Libre <contact@solution-libre.fr>
# 
# This file is part of Dolibarr with Docker Compose.
# 
# Dolibarr with Docker Compose is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Dolibarr with Docker Compose is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Dolibarr with Docker Compose.  If not, see <https://www.gnu.org/licenses/>.

CWD=$(pwd)
REPO='dolibarr-docker'

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

git clone https://github.com/Dolibarr/dolibarr-docker.git "${REPO}"
cd "${REPO}" || exit

git remote rm origin

git filter-repo --force\
  --path-rename LICENSE:${REPO}/LICENSE\
  --path-rename examples/with-pgsql/docker-compose.yml:${REPO}/compose.yaml\
  --path-rename examples/with-secrets/env/dolibarr.env:${REPO}/env/dolibarr.env\
  --path-rename examples/with-secrets/secrets/dolibarr_admin_password.secret:${REPO}/secrets/dolibarr_admin_password.secret\
  --path-rename examples/with-secrets/secrets/dolibarr_admin_username.secret:${REPO}/secrets/dolibarr_admin_username.secret

git filter-repo --force\
  --path ${REPO}

git reset --hard
git gc --aggressive 
git prune
git clean -fd

echo 'DOLI_DB_TYPE=pgsql' >> ${REPO}/env/dolibarr.env
sed -i\
  -e 's/\(DOLI_DB_HOST=\).*/\1postgres/'\
  -e 's/\(DOLI_DB_HOST_PORT=\).*/\15432/'\
  ${REPO}/env/dolibarr.env

sed -i\
  -e '2,7 s/./# &/'\
  -e '19,29 s/./# &/'\
  -e '33,35 s/./# &/'\
  -e '39,41 s/./# &/'\
  -e '44,45 s/./# &/'\
  ${REPO}/compose.yaml

git add ${REPO}
git commit -m "Adjustments of ${REPO} files"

cd "${CWD}" || exit

git remote add ${REPO} "/tmp/${REPO}"
git fetch ${REPO}
git rebase ${REPO}/main

git remote remove ${REPO}
rm -rf "/tmp/${REPO}"
