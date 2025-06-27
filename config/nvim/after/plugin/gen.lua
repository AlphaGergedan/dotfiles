local gen = require('gen')
local opts = {
  model = 'qwen2.5-coder:7b',           -- 'codellama:7b', 'codegemma:7b', 'codegeex4:9b', 'command-r7b:7b', 'starcoder2:3b', 'starcoder2:7b'
  quit_map = 'q',                       -- set keymap to close the response window
  retry_map = '<c-r>',                  -- set keymap to re-send the current prompt
  accept_map = '<c-cr>',                -- set keymap to replace the previous selection with the last result
  host = 'localhost',                   -- the host running the Ollama service
  port = '11434',                       -- the port on which the Ollama service is listening
  display_mode = "vertical-split",      -- the display mode. Can be "float" or "split" or "horizontal-split" or "vertical-split".
  show_prompt = true,                   -- shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
  show_model = true,                    -- displays which model you are using at the beginning of your chat session.
  no_auto_close = false,                -- never closes the window automatically.
  file = false,                         -- write the payload to a temporary file to keep the command short.
  hidden = false,                       -- hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
  -- Function to initialize Ollama
  init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
  command = function(options)
    local body = {model = options.model, stream = true}
    return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
  end,
  -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
  -- This can also be a command string.
  -- The executed command must return a JSON object with { response, context }
  -- (context property is optional).
  -- list_models = '<omitted lua function>', -- Retrieves a list of model names
  result_filetype = "markdown", -- Configure filetype of the result buffer
  debug = false -- Prints errors and the command which is run.
}
gen.setup(opts)
-- TODO: add more prompts using
gen.prompts['Elaborate_Test'] = {
  prompt = 'Elaborate the following text:\n$text',
  replace = true,
}
gen.prompts['Fix_Code'] = {
  prompt = 'Fix the following code. Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```',
  replace = true,
  extract = '```$filetype\n(.-)```',
}
--
-- You can also use $input
-- TODO: select specific models according to your hardware for short code completion tasks, complex programming tasks, and for general purpose writing.
--
--prompt: (string | function) Prompt either as a string or a function which should return a string. The result can use the following placeholders:
--$text: Visually selected text or the content of the current buffer
--$filetype: File type of the buffer (e.g. javascript)
--$input: Additional user input
--$register: Value of the unnamed register (yanked text)
--replace: true if the selected text shall be replaced with the generated output
--extract: Regular expression used to extract the generated result
--model: The model to use, default: mistral

-- Keymaps
vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')

