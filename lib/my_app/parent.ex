defmodule MyApp.Parent do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name, :string, default: ""

    embeds_many :children, MyApp.Child, on_replace: :delete
  end

  def changeset(parent, attr) do
    parent
    |> cast(attr, [:name])
    |> cast_embed(:children, required: true)
    |> validate_required([:name])
  end
end
