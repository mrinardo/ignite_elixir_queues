defmodule QueueTest do
  use ExUnit.Case, async: true

  describe "start_link/1" do
    test "when starting a process, return its PID" do
      response = Queue.start_link([1, 2, 3, 4, 5])

      assert {:ok, _pid} = response
    end
  end

  describe("enqueue/2") do
    setup :setup_queue

    test "when there's a value, adds it to the queue", %{pid: pid} do
      response = Queue.enqueue(pid, 6)

      assert :ok == response
    end
  end

  describe("dequeue/1") do
    setup :setup_queue

    test "removes the first item from the queue and returns it", %{pid: pid} do
      response = Queue.dequeue(pid)

      assert 1 == response
    end
  end

  defp setup_queue(_context) do
    {:ok, pid} = Queue.start_link([1, 2, 3, 4, 5])

    {:ok, pid: pid}
  end
end
