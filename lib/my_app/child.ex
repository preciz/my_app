defmodule MyApp.Child do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name, :string
    field :age, :integer
    field :selected, :boolean
  end

  def changeset(child, attr) do
    child
    |> cast(attr, [:name, :age, :selected])
    |> validate_required([:name, :age])
  end
end
