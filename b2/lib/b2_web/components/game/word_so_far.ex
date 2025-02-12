defmodule B2Web.Components.Game.WordSoFar do
  use B2Web, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      In WordSoFar
    </div>
    """
  end
end
