{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)
#AMQP.Queue.declare(channel, "hello")

  message = 
    case System.argv do
      [] -> "Heyyo"
      words -> Enum.join(words, " ")
    end

AMQP.Basic.publish(channel, "", "task_queue", message, persistent:true)
IO.puts " [x] sent '#{message}'"
AMQP.Connection.close(connection)
