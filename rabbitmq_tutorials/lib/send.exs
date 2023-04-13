{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "hello")
AMQP.Basic.publish(channel, "", "hello", "Whattup Playa")
IO.puts " [x] sent 'Whattup Playa'"
AMQP.Connection.close(connection)
