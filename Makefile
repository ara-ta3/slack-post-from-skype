init:
	cp token.sample token

start-get-messages:
	nohup sh query/get_messages.sh &

start-fluentd:
	nohup fluentd -c fluent.conf &

search-fluent-process:
	ps aux|grep fluent

search-query-process:
	ps aux|grep query
