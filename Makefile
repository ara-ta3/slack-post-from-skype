init:
	cp token.sample token

start-get-messages:
	nohup sh query/get_messages.sh &

start-fluentd:
	nohup fluentd -c fluent.conf &

start-slack-polling:
	nohup sh skypescript/run.sh &

search-fluent-process:
	ps aux|grep fluent

search-query-process:
	ps aux|grep query

search-skype-polling:
	ps aux|grep skypescript
