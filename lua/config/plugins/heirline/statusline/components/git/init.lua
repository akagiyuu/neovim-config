local conditions = require('heirline.conditions')

local git_count = require(... .. '.util').git_count
local null = { provider = '' }

local added   = git_count('added', 'git_add', '  ')
local removed = git_count('removed', 'git_del', '  ')
local changed = git_count('changed', 'git_change', '  ')

return {
    condition = conditions.is_git_repo,

    init = function(self) self.git_status = vim.b.gitsigns_status_dict end,
    {
        flexible = 2,
        {
            {
                provider = '  ',
                hl = { fg = 'git_add' },
            },
            { provider = function(self) return self.git_status.head end },
        },
        null
    },
    {
        condition = function(self)
            return self.has_changes == self.git_status.added ~= 0
                or self.git_status.removed ~= 0
                or self.git_status.changed ~= 0
        end,
        {
            flexible = 4,
            { added, removed, changed },
            { removed, changed },
            { removed },
            null
        },
    },
}
