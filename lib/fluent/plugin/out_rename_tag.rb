module Fluent
  class RenameTagOutput < Output
    Plugin.register_output('rename_tag', self)

    def emit(tag, es, chain)
      es.each { |time, record|
        split_tag = tag.split('.')
        new_tag = "#{split_tag.first}_#{split_tag[1..-2].join('_')}".gsub(/[^0-9a-zA-Z_]/, '_0_')
        new_tag = "runway.#{new_tag}"
        Engine.emit(new_tag, time, record)
      }
      chain.next
    rescue => e
      $log.warn "#{e.class} #{e.message} #{e.backtrace.first}"
    end
  end
end
