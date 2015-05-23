# coding: utf-8
module Chibineko
  module RSpec
    class ExampleGroupExporter
      attr_accessor :root, :testcase
      def initialize(exgroup, testcase)
        self.root = exgroup
        self.testcase = testcase
      end

      def export(parent=root,items=testcase.items,depth=0)
        exporter = self
        items.group_by {|item|
          item.groups[depth]
        }.each {|group,items|
          if group
            parent.describe "#{group}" do
              exporter.export(self, items, depth + 1)
            end
          else
            items.each do |item|
              create_example(parent,item)
            end
          end
        }
      end
      def create_example(parent, item)
        if item.pending?
          parent.it "#{item.item}" do
            pending(item.memo)
          end
        elsif item.skip?
          parent.xit "#{item.item}" do
            expect(item).to be_ok            
          end
        else
          parent.it "#{item.item}" do 
            expect(item).to be_ok
          end
        end
      end
    end
  end
end
