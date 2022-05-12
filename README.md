# Flyway Recipe

## Flywayを忘れたときに、これを見て思い出す！
1. Flywayの初期設定（`conf/flyway.conf`）をする。  
```
# DBへの接続URL
flyway.url=jdbc:postgresql://db:5432/work

# DBに接続するユーザーとパスワード
flyway.user=postgres
flyway.password=postgres

# 管理するSQLファイルを格納するパス
flyway.locations=filesystem:sql
```

2. FlyawayからDBに接続できるか確認する。
```bash
$ flyway info
Flyway is up to date
Flyway Community Edition 8.5.10 by Redgate
See what's new here: https://flywaydb.org/documentation/learnmore/releaseNotes#8.5.10

Database: jdbc:postgresql://db:5432/work (PostgreSQL 12.7)
Schema version: 4

+-----------+---------+-----------------------+----------+---------------------+----------+
| Category  | Version | Description           | Type     | Installed On        | State    |
+-----------+---------+-----------------------+----------+---------------------+----------+
+-----------+---------+-----------------------+----------+---------------------+----------+
```

3. ベースラインを作成する。
```bash
$ flyway baseline
flyway@d4fb4712499a:~$ flyway info
Flyway is up to date
Flyway Community Edition 8.5.10 by Redgate
See what's new here: https://flywaydb.org/documentation/learnmore/releaseNotes#8.5.10

Database: jdbc:postgresql://db:5432/work (PostgreSQL 12.7)
Schema version: 4

+-----------+---------+-----------------------+----------+---------------------+----------+
| Category  | Version | Description           | Type     | Installed On        | State    |
+-----------+---------+-----------------------+----------+---------------------+----------+
|           | 1       | << Flyway Baseline >> | BASELINE | 2022-05-09 04:27:27 | Baseline |
+-----------+---------+-----------------------+----------+---------------------+----------+
```

4. SQLファイルをsql配下に作成する。  
SQLファイルの命名規則

5. 
Aの修正1
Aの修正2
Aの修正3