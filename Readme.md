# Picture colour statistcs

## Install
Clone this project

`git clone this_project`

## Usage
Require the file picture.rb in your project and call `Picture::FromCSV.new(csv_file)`

```ruby
require_relative 'project_path/picture'

Picture::FromCSV.new(file_path.csv)
```

### CSV file format

The CSV file should have canvas dimensions on the first row. The following should contain sections that you want add to the picture.

Example:

```
20 10
1 5 5 10 3
2 0 0 7 7
```

## Tests
Before run tests install gems

`bundle install`

Run tests

`rspec specs`
