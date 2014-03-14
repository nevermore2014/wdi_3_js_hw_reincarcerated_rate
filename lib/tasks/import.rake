require_relative "../import_recid_data"
namespace :import do

  desc "Import my recid data"
  # C make
  # Ruby rake
  # Invoke the  :environment task before this redic_data task.
  # Make models, ... available to the ruby we'll write this taks.
  task recid_data: :environment do
    ImportRecid.import
  end

  desc "Clear DB State data"
  task clear_states: :environment do
    State.delete_all
  end

end
