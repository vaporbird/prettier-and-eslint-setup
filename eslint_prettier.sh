#!/bin/bash
# \e[91m means red color, \e[39m - Default color
echo -e '\e[91m Create package.json (npm init) \e[39m'
echo -e '\e[91m Spam Enter \e[39m'
npm init
echo -e '\e[91m Option sequence 3-2...<after as you decude> and airbnb style (eslint --init) \e[39m'
npx eslint --init
echo -e 'ADDS \e[91m "plugin:prettier/recommended"\e[39m' to eslint file in extends[] 
touch .prettierrc
echo { > .prettierrc
echo    \"semi\": true, >> .prettierrc
echo    \"trailingComma\": \"es5\", >> .prettierrc
echo    \"singleQuote\": true, >> .prettierrc
echo     \"printWidth\": 80 >> .prettierrc
echo } >> .prettierrc

echo module.exports = { > .eslint
echo   env: { >> .eslint
echo     browser: true, >> .eslint
echo     commonjs: true, >> .eslint
echo     es2021: true, >> .eslint
echo     node: true, >> .eslint
echo   }, >> .eslint
echo   extends: [\'airbnb-base\', \'plugin: prettier/recommended\', \'prettier\'], >> .eslint
echo   plugins: [\'prettier\'], >> .eslint
echo   overrides: [], >> .eslint
echo   parserOptions: { >> .eslint
echo     ecmaVersion: \'latest\', >> .eslint
echo   }, >> .eslint
echo   rules: { \'prettier/prettier\': 2 }, >> .eslint
echo }; >> .eslint

echo -e "ADDS \e[91mprettier-format": "prettier --config .prettierrc './*.js' --write \e[39m to package.json in scripts {} "

ex package.json <<
/"scripts": {/ + 1 insert
,
.

ex package.json <<eof
/"scripts": {/ + 1 insert
"prettier-format": "prettier --config .prettierrc './*.*' --write"
.
xit
eof

npm run prettier-format