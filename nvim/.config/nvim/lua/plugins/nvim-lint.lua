return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      terraform = { "checkov", "tflint", "tfsec" },
    },
    linters = {
      checkov = {
        cmd = "checkov",
        args = {
          "--output",
          "json",
          "--file",
        },
        stdin = false,
        append_fname = true,
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output)
          local decoded = vim.json.decode(output) or {}
          local failed_checks = decoded["results"]["failed_checks"] or {}
          local diagnostics = {}

          for _, check in pairs(failed_checks) do
            table.insert(diagnostics, {
              lnum = tonumber(check.file_line_range[1]),
              end_lnum = tonumber(check.file_line_range[2]),
              col = 0,
              source = "checkov",
              severity = vim.diagnostic.severity.INFO, -- TODO: Fix this
              message = string.format("%s (%s)\nReference: %s", check.check_name, check.check_id, check.guideline),
            })
          end

          return diagnostics
        end,
      },
    },
  },
}
