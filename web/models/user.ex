defmodule PhoenixDemo.User do
  use PhoenixDemo.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields ~w(email password)
  @optional_fields ~w()

  def changeset(struct, params \\ :empty) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/^\S+@\S+\.\S+$/)
    |> validate_length(:password, min: 5)
  end
end
