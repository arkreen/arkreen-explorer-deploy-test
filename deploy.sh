#!/usr/bin/env sh

# 发生错误时终止
set -e

# 构建
yarn build

rm -rf ./dist

cp -rf ./build ./dist

# 进入构建文件夹
cd dist

# 放置 .nojekyll 以绕过 Jekyll 的处理。
echo > .nojekyll

# 如果你要部署到自定义域名
echo 'explorer.aigc.it' > CNAME

git init
git checkout -B main
git add -A
git config --global user.email "tokenhashio@gmail.com"
git config --global user.name "tokenhash"
git commit -m 'deploy'

# 如果你要部署在 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git main

# 如果你要部署在 https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git main:gh-pages
git push -f https://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@github.com/arkreen/arkreen-explorer-deploy-test.git main:gh-pages
cd -
