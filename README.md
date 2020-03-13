# scripts

## `concat.sh`

### Features
* Will unzip file & check if headers (first line) in all files match
* Will merge all files into one file with destination and file name of choice

### Run
1. navigate to directory containing `concat.sh`
2. `chmod 755 concat.sh`
3. run `./concat.sh ../clean.zip ../businessname_reservations.csv`
  * where `../clean.zip` is the path to zip file containing files you want to concatenate
  * where `../businessname_reservations.csv` is the name and destination of the final file you want to create

---

## `createRunCommands.sh`

### Features
* Will create all commands for import using crawl-server (for single-entry of data from salesforce & logging of commands)

### Run
1. navigate to directory containing `createRunCommands.sh`
2. `chmod a+x concat.sh`
3. run `./createRunCommands.sh`
4. enter in the information in the prompt
5. the file for the run commands will be generated for you to follow