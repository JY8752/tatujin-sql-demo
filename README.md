# 達人に学ぶSQL

## コンテナ起動

```
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d --rm mysql
````

## コンテナ内にファイルをコピーする

```
docker cp ./3.sql some-mysql:./3.sql
```

## コンテナ入る

```
docker exec some-mysql bash
```

## コンテナでSQLファイル実行

```
mysql -u root -pmy-secret-pw test < 3.sql
```
