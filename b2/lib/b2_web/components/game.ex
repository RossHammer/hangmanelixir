defmodule B2Web.Components.Game do
  use B2Web, :live_view

  def mount(_params, _session, socket) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    {:ok, assign(socket, game: game, tally: tally)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.live_component module={__MODULE__.Figure} tally={@tally} id="Figure" />
      <.live_component module={__MODULE__.Alphabet} tally={@tally} id="Alphabet" />
      <.live_component module={__MODULE__.WordSoFar} tally={@tally} id="WordSoFar" />
    </div>
    """
  end
end
