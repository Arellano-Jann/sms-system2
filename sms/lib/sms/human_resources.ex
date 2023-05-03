defmodule Sms.HumanResources do

  alias Sms.HumanResources.Employee
  # @url "http://localhost:4000/api/employees"
  # no match of right hand side value: {:error, %HTTPoison.Error{reason: :econnrefused, id: nil}} # this gets returned when the opposite server above is not running

  def list_employees do # used in employee_live/index.ex
    with {:ok, response} = HTTPoison.get("http://localhost:4000/api/employees"),
      {:ok, values} = Jason.decode(response.body) do
        keys_to_atoms(values["data"])
        |> Enum.map(&(struct(Employee, &1)))
      end
  end

  # def get_employee(id) do
  #   with {:ok, response} = HTTPoison.get("http://localhost:4000/api/employees" <> "/#{id}"),
  #     {:ok, values} = Jason.decode(response.body) do
  #       IO.inspect(values)
  #     end
  # end

  defp keys_to_atoms(json_list) do # converts all of a maps keys to atoms
    json_list
    |> Enum.map(fn row ->
      row
      |> Enum.map(fn {k, v} -> {String.to_atom(k), v} end)
    |> Enum.into(%{})
    end)
  end

end
