defmodule Relisa do
  def say(message) do
    Mix.shell.info "{relisa} ----> #{message}"
  end

  def subsay(message) do
    Mix.shell.info "{relisa}       |----> #{message}"
  end
end
