SyncPrompt = require('./sync_prompt')
Output = require('./output/local_output')
commands = require('./commands')

class App

  _commands: []

  constructor: (@scope) ->
    @output = new Output()
    @prompt = new SyncPrompt({
      callback: @find_command
    })

  commands: ->
    if @_commands.length is 0
      @_commands.push new command({@output, @scope}) for i,command of commands
    @_commands

  find_command: (input, chain) =>
    for command in @commands()
      if match = command.match(input)
        args = String(match[1]).trim().split(' ')
        return command.execute.call command, args, chain
    false

  open: ->
    @prompt.type('whereami')

module.exports = App
