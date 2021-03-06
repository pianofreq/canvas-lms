#
# Copyright (C) 2015 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

require File.expand_path(File.dirname(__FILE__) + '/../common')

module DeveloperKeysRewriteCommon
  def click_inherited_tab
    fj("span:contains('Inherited'):last").click
    wait_for_ajaximations
  end

  def click_account_tab
    fj("#reactContent span[role='tablist'] span:contains('Account')").click
    wait_for_ajaximations
  end

  def click_edit_icon
    fj("table[data-automation='devKeyAdminTable'] button:has(svg[name='IconEdit'])").click
  end

  def click_enforce_scopes
    f("[data-automation='enforce_scopes'] div").click
  end

  def click_scope_group_checkbox
    fxpath('//*[@class="scopes-group"]/span/span').click
  end

  def click_scope_checkbox
    fxpath("//*[@class='developer-key-scope']/span/span").click
  end

  def select_all_readonly_checkbox
    fxpath("//*[@class='scopes-list']/span/div/span/span/span/span/div")
  end

  def all_endpoints_readonly_checkbox_selected?
    f(".scopes-list input[type='checkbox']").selected?
  end

  def expand_scope_group_by_filter(scope_group, context_id)
    get "/accounts/#{context_id}/developer_keys"
    find_button("Developer Key").click
    click_enforce_scopes
    filter_scopes_by_name(scope_group)
    fj(".toggle-scope-group span:contains('#{scope_group}')").click
  end

  def filter_scopes_by_name(scope)
    f("input[placeholder='Search endpoints']").clear
    f("input[placeholder='Search endpoints']").send_keys scope
  end
end
