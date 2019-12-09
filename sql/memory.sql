select memory, gb
from qpi.memory
where substring(memory, 1, 2) <> '--';