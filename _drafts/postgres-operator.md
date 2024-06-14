mencari solusi alternative dari stackgres di kube

## Pake Zolando Postgres Operator

https://postgres-operator.readthedocs.io/en/latest/

### Cara install

- jadi coba install via helm, karena klo pake config manual lama perlu berlajar setting2nya

- [linknya](https://github.com/zalando/postgres-operator/blob/master/docs/quickstart.md#helm-chart) berikut ini

- kokumentasi [UI nya](https://github.com/zalando/postgres-operator/blob/master/docs/operator-ui.md)
- ui nya nggk jalan, jadi ngikutin dri [issue github](https://github.com/zalando/postgres-operator/issues/2302#issuecomment-1520551386)

      helm install postgres-operator-ui postgres-operator-ui-charts/postgres-operator-ui --version 1.10.0

- berhasil dijalankan

### Create Cluster Buat database

- via ui diatas
- karena minimum di gke google, maka minimal spek atau requirednya
  - cpu 250
  - ram 500
- cara ambil passwordnya

```
kubectl get secret <nama-secretnya-apa> --template '{{ printf "username = %s\n" (.data.username | base64decode) }}'

kubectl get secret <nama-secretnya-apa> --template '{{ printf "password = %s\n" (.data.password | base64decode) }}'
```

- cara koneknya

```
kubectl port-forward <nama-podnya> --address 0.0.0.0 5433:5432
```

- cluster nggk bisa konek, jadi harus setting confignya aja, constoh yg bener

```
kind: "postgresql"
apiVersion: "acid.zalan.do/v1"

metadata:
 name: "postgres-sanbox"
 namespace: "default"
 labels:
   team: acid

spec:
 teamId: "acid"
 postgresql:
   version: "15"
 numberOfInstances: 2
 volume:
   size: "10Gi"
 users:
   # database owner
   fungsitama: # ini usernya
   - superuser # ini hak asesnya
   - createdb  # ini hak asesnya
 databases:
   sms: fungsitama      # database dengan aksesnya
   services: fungsitama # database dengan aksesnya
 allowedSourceRanges: []
   # IP ranges to access your cluster go here

 resources:
   requests:
     cpu: 500m
     memory: 500Mi
   limits:
     cpu: 500m
     memory: 500Mi
```

- jangan lupa connection string `sslmode=require`

- kemudian error pas migration `pq: cannot execute CREATE TABLE in a read-only transaction` jadinya manual sql query pake, loginnya pake user postgres dan arahkan dbnya ke postgres:
  `alter database <yourDB> set default_transaction_read_only = off;`
- gagal semua, jadi coba pake produk aja dah
  https://www.crunchydata.com/pricing/calculator?provider=gcp&region=asia-southeast2&tier=standard&plan=hobby-2&storage=1024
