defmodule B2Web.Components.Game do
  use B2Web, :live_view

  def mount(_params, _session, socket) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    {:ok, assign(socket, game: game, tally: tally)}
  end

  def handle_event("make_move", %{"key" => key}, socket) do
    tally = Hangman.make_move(socket.assigns.game, key)
    {:noreply, assign(socket, :tally, tally)}
  end

  def render(assigns) do
    ~H"""
    <div phx-window-keyup="make_move" class="flex gap-5 items-center">
      <.live_component module={__MODULE__.Figure} tally={@tally} id="Figure" />
      <div>
        <.live_component module={__MODULE__.Alphabet} tally={@tally} id="Alphabet" />
        <.live_component module={__MODULE__.WordSoFar} tally={@tally} id="WordSoFar" />
      </div>
    </div>
    """
  end
end
