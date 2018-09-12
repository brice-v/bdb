# bdb
Cstack's sqlite copy in c


## Building
run `make` in the cmd line
run `make clean` to clean all previous files

## Testing
run `bundle exec rspec`


## Running
`./bdb <name.db>`

- Commands
  - `insert <key> <name> <email>` inserts into the database
  - `select` works as select all
  - `.btree` displays tree
  - `.exit` exits
