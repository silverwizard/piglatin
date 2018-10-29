piglatin.sh exists to support the piglatin docker container service.

It requires an external pig latin service to be running, but a docker container is provided to support local development.

.piglatinrc MUST be in the form

`HOST=hostname
PORT=portname`

If you must either of these then the defaults will be used. Other imports are ignored.

Requirements:
	This requires a standard POSIX bash shell with dos2unix installed to support removing CRLFs from webserver
