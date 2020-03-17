module ActiveRecord
  module ConnectionHandling
     # Enable standard-conforming strings if available.
      def set_standard_conforming_strings
        old, self.client_min_messages = client_min_messages, 'error'
        execute('SET standard_conforming_strings = on', 'SCHEMA') rescue nil
      ensure
        self.client_min_messages = old
      end
  end
end