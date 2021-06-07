# frozen_string_literal: true

class CreateDummies < ActiveRecord::Migration[5.2]
  def change
    create_table :dummies do |t|
      t.string :name
    end
  end
end
