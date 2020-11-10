# Client Mode with RICOH THETA

Client mode only works with the RICOH THETA V and Z1 models. It will not work
with the SC2.

On the Z1, the [http_auth](https://pub.dev/packages/http_auth/example) package does not appear to work.

Working example using curl:

```bash
curl --digest --user "THETAYL00105377:00105377" -X GET http://192.168.2.101/osc/info
```
