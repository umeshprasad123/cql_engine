package org.opencds.cqf.cql.elm.execution;

import org.opencds.cqf.cql.exception.InvalidLiteral;
import org.opencds.cqf.cql.execution.Context;

import java.math.BigDecimal;

public class LiteralEvaluator extends org.cqframework.cql.elm.execution.Literal {

    @Override
    protected Object internalEvaluate(Context context) {
        switch (this.getValueType().getLocalPart()) {
            case "Boolean": return Boolean.parseBoolean(this.getValue());
            case "Integer": return Integer.parseInt(this.getValue());
            case "Decimal": return new BigDecimal(this.getValue());
            case "String": return this.getValue();
            default: throw new InvalidLiteral(String.format("Cannot construct literal value for type '%s'.", this.getValueType().toString()));
        }
    }
}
