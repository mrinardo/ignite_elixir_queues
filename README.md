# Queues

This module demonstrates how to use GenServer to create a queue.

It's [challenge #1](https://www.notion.so/Desafio-01-Filas-4db900b9954b43cca1de35ae9d44da71) of Rocketseat's Ignite Elixir module 8.

## Usage

Once inside the project's directory, you can run it using Elixir's interactive shell:

```shell
$ iex -S mix
```

Call "start_link" to start the server, "enqueue" to add an item to the queue and "dequeue" to remove the next item from the queue.

```elixir
iex(1)> {:ok, pid} = Queue.start_link([1,2,3])
{:ok, #PID<0.225.0>}

iex(2)> Queue.enqueue(pid,4)                  
:ok

iex(3)> Queue.dequeue(pid)  
1
```

## Tests

You can also run the tests script in the terminal (outside `iex`):

```shell
$ mix test
```

