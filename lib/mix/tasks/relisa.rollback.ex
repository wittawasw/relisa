defmodule Mix.Tasks.Relisa.Rollback do
  use Mix.Task

  @shortdoc "Rolls back the current OTP release to a previous release (if able)"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    Mix.shell.info "Rollback!"
  end

  # We can define other functions as needed here.
end
