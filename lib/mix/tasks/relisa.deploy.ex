defmodule Mix.Tasks.Relisa.Deploy do
  use Mix.Task

  @shortdoc "Packages and deploys an OTP release"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    Mix.shell.info "Deploy!"
  end

  # We can define other functions as needed here.
end
