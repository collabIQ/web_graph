defmodule WebGraph.Test.Login do
  use WebGraph.ConnCase, async: true

  @query """
  mutation ($email: String!, $password: String!) {
    login(email:$email,password:$password) {
      token
      errors{
        message
      }
    }
  }
  """

  test "admin login", %{conn: conn} do
    response =
      post(conn, "/graphql", %{
        query: @query,
        variables: %{"email" => "admin@email.com", "password" => "password"}
      })

    assert %{"data" => %{"login" => %{"token" => token}}} = json_response(response, 200)
  end
end
