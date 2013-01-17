# omnigollum の雛形

## 使い方

### 1. bundle install

```
$ git clone https://github.com/moqada/omnigollum_site.git
$ cd omnigollum_site
$ bundle install
```

### 2. 環境にあわせて config.ru, gollum.yaml を編集

```sh
$ cp gollum.yaml.example gollum.yaml
$ cp config.ru.example config.ru
```

そのまんま conrig.ru を利用すれば LDAP 用

### 3. 起動

#### Rack

```sh
$ bundle exec rackup
```

#### Unicorn

```sh
$ cp unicorn.rb.example unicorn.rb
$ bundle exec unicorn -c unicorn.rb
```


## 備考

ruby よくわかってないので色々適当
