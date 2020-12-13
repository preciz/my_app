defmodule MyAppWeb.ParentLive do
  use MyAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    children = [
      %MyApp.Child{name: "child_1", age: 22, selected: true},
      %MyApp.Child{name: "child_2", age: 24, selected: true},
      %MyApp.Child{name: "child_3", age: 26, selected: true}
    ]

    changeset =
      MyApp.Parent.changeset(%MyApp.Parent{}, %{})
      |> Ecto.Changeset.put_embed(:children, children)

    {:ok, assign(socket, changeset: changeset)}
  end

  @impl true
  def handle_event("update", %{"parent" => parent_params}, socket) do
    changeset = MyApp.Parent.changeset(socket.assigns.changeset, parent_params)

    {:noreply, assign(socket, changeset: changeset)}
  end
end
