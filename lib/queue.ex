defmodule Queue do
  use GenServer

  # Client
  def start_link(initial_queue \\ []) when is_list(initial_queue) do
    GenServer.start_link(__MODULE__, initial_queue)
  end

  def enqueue(pid, value) do
    GenServer.cast(pid, {:enqueue, value})
  end

  def dequeue(pid) do
    GenServer.call(pid, :dequeue)
  end

  # Server
  @impl true
  def init(queue) do
    {:ok, queue}
  end

  @impl true
  def handle_cast({:enqueue, value}, queue) do
    new_queue = List.insert_at(queue, -1, value)

    {:noreply, new_queue}
  end

  @impl true
  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end
end
