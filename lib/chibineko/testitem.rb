# coding: utf-8
require "csv"

module Chibineko
  class TestItem
    STATUS_OK=["OK","Passed"]
    STATUS_PENDING=["保留","Deferred"]
    STATUS_FAIL=["NG","未実施","Failed","Not started"]
    STATUS_SKIP=["対象外","N/A"]
    GROUP_DEPTH=5

    attr_accessor :groups, :item, :status, :memo, :source, :line
    
    def initialize(row, src, line_num = -1)
      self.memo= row.field(-1)
      self.status= row.field(-2)
      self.item= row.field(-3)
      self.groups= GROUP_DEPTH.times.map {|offset|
        group = row.field('-', offset)
        (group.nil? or group.empty?) ? nil : group
      }
      self.source= src
      self.line=line_num
    end
    def ok?
      STATUS_OK.include?(status)
    end
    def ng?
      STATUS_FAIL.include?(status)
    end
    def execute?
      ok? or ng?
    end
    def skip?
      STATUS_SKIP.include?(status)
    end
    def pending?
      STATUS_PENDING.include?(status)
    end
    def location
      source + "#" + line
    end
  end
end
