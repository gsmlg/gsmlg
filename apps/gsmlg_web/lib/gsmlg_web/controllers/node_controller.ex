defmodule GSMLGWeb.NodeController do
  use GSMLGWeb, :controller

  def index(conn, _params) do
    state = GSMLG.Node.Self.get_state
    conn
    |> json(%{name: state.self, isAlive: state.alive?, nodes: GSMLG.Node.Others.get_nodes, node_list: Node.list})
  end

end
