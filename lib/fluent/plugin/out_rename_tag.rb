module Fluent
  class RenameTagOutput < Output
    Plugin.register_output('rename_tag', self)

    def emit(tag, es, chain)
      es.each { |time, record|
        split_tag = tag.split('.')
        new_tag = "runway.#{split_tag.first}_#{split_tag[1..-2].join('_')}"
        Engine.emit(new_tag, time, record)
      }
      chain.next
    rescue => e
      $log.warn "#{e.class} #{e.message} #{e.backtrace.first}"
    end
  end
end
