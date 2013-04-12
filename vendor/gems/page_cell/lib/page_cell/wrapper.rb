#encoding: utf-8
module PageCell
  class Wrapper
    attr_accessor :value,:parent
    def initialize(value, parent = nil)
      @value, @parent = value, parent
    end

    def [](name)
      return $1 if name =~ /\A(?:"|')(.*)(?:"|')\Z/

      if value.respond_to?(:has_key?)
        return wrap(value[name.to_sym]) if value.has_key?(name.to_sym)
        return wrap(value[name.to_s]) if value.has_key?(name.to_s)
      end
      return wrap(value.send(name)) if value.respond_to?(name)
      v = wrap_instance_variable(name)
      return v unless v.nil?
      v = wrap_method_from_instance(self,name)
      return v unless v.nil?
      parent[name] if parent
    end

    def wrap_method_from_instance(instance,name)
      if name.include?('.') || name =~ /\[[^\[\]].*\]/
        name.split(/\.|\[|\]/).map{|m| m.strip.gsub(/'|"/,'')}.select{|m| m.present?}.each do |m|
          return nil if instance.nil?
          instance = Wrapper.new(instance) unless instance.kind_of? Wrapper
          instance = instance[m]
        end
        instance
      end
    end

    def wrap_instance_variable(name)
      return nil if name !~ /\A(:?[a-z0-9_]|@)+\Z/i
      return wrap(value.instance_variable_get("@#{name}")) if !name.include?('@') && value.instance_variable_defined?("@#{name}") 
      return wrap(value.instance_variable_get(name)) if name =~ /\A@/ && value.instance_variable_defined?(name)   
    end

    def empty?
      value.respond_to?(:empty) && value.empty?
    end

    def to_s
      value.to_s
    end

    private

    def wrap(response)
      # Primitives are not wrapped
      if [String, Numeric, TrueClass, FalseClass, NilClass].any? {|primitive| primitive === response }
        response
        # Enumerables are mapped with wrapped values (except Hash-like objects)
      elsif !response.respond_to?(:has_key?) && response.respond_to?(:map)
        response.map {|v| wrap(v) }
      else
        Wrapper.new(response, self)
      end
    end

  end
end

