defmodule ElixirSense.Core.Normalized.Code.Fragment do
  @moduledoc false

  def cursor_context(string, opts \\ []) do
    cond do
      Version.match?(System.version(), ">= 1.14.0-dev") ->
        apply(Code.Fragment, :cursor_context, [string, opts])

      true ->
        # fall back to bundled on < 1.13
        # on 1.13 use our version as it has all the fixes from last 1.13 release
        apply(ElixirSense.Core.Normalized.Code.ElixirSense.Fragment, :cursor_context, [
          string,
          opts
        ])
    end
  end

  def surround_context(fragment, position, options \\ []) do
    cond do
      Version.match?(System.version(), ">= 1.14.0-dev") ->
        apply(Code.Fragment, :surround_context, [fragment, position, options])

      true ->
        # fall back to bundled on < 1.13
        # on 1.13 use our version as it has all the fixes from last 1.13 release
        apply(ElixirSense.Core.Normalized.Code.ElixirSense.Fragment, :surround_context, [
          fragment,
          position,
          options
        ])
    end
  end

  def container_cursor_to_quoted(fragment, opts \\ []) do
    cond do
      Version.match?(System.version(), ">= 1.14.0-dev") ->
        apply(Code.Fragment, :container_cursor_to_quoted, [fragment, opts])

      true ->
        # fall back to bundled on < 1.13
        # on 1.13 use our version as it has all the fixes from last 1.13 release
        apply(
          ElixirSense.Core.Normalized.Code.ElixirSense.Fragment,
          :container_cursor_to_quoted,
          [fragment, opts]
        )
    end
  end
end
