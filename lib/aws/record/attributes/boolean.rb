# Copyright 2011-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'aws/record/attribute'

module AWS
  module Record

    # @private
    class BooleanAttribute < Attribute

      def self.type_cast raw_value, options = {}
        case raw_value
        when nil then nil
        when '' then nil
        when false, 'false', '0', 0 then false
        else true
        end
      end

      def self.serialize boolean, options = {}
        case boolean
        when false then '0'
        when true  then '1'
        else 
          msg = "expected a boolean value, got #{boolean.class}"
          raise ArgumentError, msg
        end
      end

      # @private
      def self.allow_set?
        false
      end

    end

  end
end
