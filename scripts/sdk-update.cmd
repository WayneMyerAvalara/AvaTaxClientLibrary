SET VERSION=%1
SET USER_AGENT=%2

SET JSON="{\"title\": \"Update for %VERSION%\", \"head\": \"avaDev:%VERSION%\", \"base\": \"master\", \"maintainer_can_modify\": true, \"body\": \"Update for %VERSION%\"}"

START /WAIT "" "%PROGRAMFILES%\Git\bin\sh.exe" -c "sh git-branch.sh %VERSION%"

cd ..\generator\ClientApiGenerator\bin\Debug\
START /WAIT ClientApiGenerator.exe -g C:\git\develop\AvaTaxClientLibrary\scripts\avataxapi.json

cd ..\..\..\..\scripts
START /WAIT "" "%PROGRAMFILES%\Git\bin\sh.exe" -c "sh git-commit.sh %VERSION%"

curl -H "User-Agent: %USER_AGENT%" -H "Content-Type: application/json" -H "Authorization: token %GIT_TOKEN%" -X POST --data %JSON% https://api.github.com/repos/avaDev/AvaTax-REST-V2-DotNet-SDK/pulls
curl -H "User-Agent: %USER_AGENT%" -H "Content-Type: application/json" -H "Authorization: token %GIT_TOKEN%" -X POST --data %JSON% https://api.github.com/repos/avaDev/AvaTax-REST-V2-JS-SDK/pulls
curl -H "User-Agent: %USER_AGENT%" -H "Content-Type: application/json" -H "Authorization: token %GIT_TOKEN%" -X POST --data %JSON% https://api.github.com/repos/avaDev/AvaTax-REST-V2-PHP-SDK/pulls
curl -H "User-Agent: %USER_AGENT%" -H "Content-Type: application/json" -H "Authorization: token %GIT_TOKEN%" -X POST --data %JSON% https://api.github.com/repos/avaDev/AvaTax-REST-V2-Python-SDK/pulls
curl -H "User-Agent: %USER_AGENT%" -H "Content-Type: application/json" -H "Authorization: token %GIT_TOKEN%" -X POST --data %JSON% https://api.github.com/repos/avaDev/AvaTax-REST-V2-Ruby-SDK/pulls
