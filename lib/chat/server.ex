defmodule Chat.Server do
	use GenServer

  @doc """

  """
	def start_link(name) do
		GenServer.start_link(__MODULE__, [], name: via(name))
	end

	def add_message(room_name, message) do
    GenServer.cast(via(room_name), {:add_message, message})
  end

  def get_messages(room_name) do
    GenServer.call(via(room_name), :get_messages)
  end

  defp via(room_name) do
    # And the tuple always follow the same format:
    # {:via, module_name, term}
    # {:via, Chat.Registry, {:chat_room, room_name}}
    {:via, :gproc, {:n, :l, {:chat_room, room_name}}}
  end

  # Server

  def init(messages) do
    {:ok, messages}
  end

  def handle_cast({:add_message, new_message}, messages) do
    {:noreply, [new_message | messages]}
  end

  def handle_call(:get_messages, _from, messages) do
    {:reply, messages, messages}
  end

end
