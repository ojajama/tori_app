class GroupsController < ApplicationController
  before_action :sign_in_require, only: [:show]
  before_action :test_user
end
