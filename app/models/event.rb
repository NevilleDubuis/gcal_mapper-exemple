class Event < ActiveRecord::Base
  attr_accessible :description, :end_at, :gid, :name, :start_at, :status, :created_at, :updated_at

  include GcalMapper::Mapper::ActiveRecord

  calendar do
    configure :file => '/home/ndubuis/.google-api.yaml'

    calendar 'neville.dubuis@liquid-concept.ch'

    google_id 'gid'

    field 'name', :source => 'summary',
                  :match => /^(.*)$/, :default => 'busy'
    field 'description', :source => 'description',
                         :match => /^category: (.*)$/, :default => 'not categorized'
    field 'status', :source => 'status'
    field 'start_at', :source => 'start.dateTime'
    field 'end_at', :source => 'end.dateTime'
  end

end