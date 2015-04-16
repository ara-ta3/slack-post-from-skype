init:
	cp token.sample token

start-get-messages:
	nohup sh query/get_messages.sh &

start-fluentd:
	nohup fluentd -c fluent.conf &
